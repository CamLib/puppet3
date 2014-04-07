#! /usr/bin/env ruby
require 'spec_helper'
require 'puppet/provider/package/pkgng'

provider_class = Puppet::Type.type(:package).provider(:pkgng)

describe provider_class do
  let(:name) { 'bash' }
  let(:pkgng) { 'pkgng' }

  let(:resource) do
    # When bash is not present
    Puppet::Type.type(:package).new(:name => name, :provider => pkgng)
  end

  let(:installed_resource) do
    # When zsh is present
    Puppet::Type.type(:package).new(:name => 'zsh', :provider => pkgng)
  end

  let(:latest_resource) do
    # When curl is installed but not the latest
    Puppet::Type.type(:package).new(:name => 'ftp/curl', :provider => pkgng, :ensure => latest)
  end

  let (:provider) { resource.provider }

  def run_in_catalog(*resources)
    catalog = Puppet::Resource::Catalog.new
    catalog.host_config = false
    resources.each do |resource|
      #resource.expects(:err).never
      catalog.add_resource(resource)
    end
    catalog.apply
  end

  before do
    provider_class.stub(:command).with(:pkg) {'/usr/local/sbin/pkg'}
    provider.stub(:command).with(:pkg) {'/usr/local/sbin/pkg'}

    info = File.read('spec/fixtures/pkg.info')
    provider_class.stub(:get_info) { info }

    version_list = File.read('spec/fixtures/pkg.version')
    provider_class.stub(:get_version_list) { version_list }
  end

  context "::instances" do
    it "should return the empty set if no packages are listed" do
      provider_class.stub(:get_info) { '' }
      provider_class.stub(:get_version_list) { '' }
      provider_class.instances.should be_empty
    end

    it "should return all packages when invoked" do
      provider_class.instances.map(&:name).sort.should ==
        %w{ca_root_nss curl nmap pkg gnupg mcollective zsh}.sort
    end

    it "should set latest to current version when no upgrade available" do
      nmap = provider_class.instances.find {|i| i.properties[:origin] == 'security/nmap' }

      nmap.properties[:version].should == nmap.properties[:latest]
    end

    describe "version" do
      it "should retrieve the correct version of the current package" do
        zsh = provider_class.instances.find {|i| i.properties[:origin] == 'shells/zsh' }
        zsh.properties[:version].should == '5.0.2_1'
      end
    end
  end

  context "#install" do
    it "should fail if pkg.conf does not exist" do
      File.stub(:exist?).with('/usr/local/etc/pkg.conf') { false }
      expect{ provider.install }.to raise_error(Puppet::Error, /pkg.conf does not exist/)
    end
  end

  context "#query" do
    # This is being commented out as I am not sure how to test the code when
    # using prefetching.  I somehow need to pass a fake resources object into
    # #prefetch so that it can build the @property_hash, but I am not sure how.
    #
    #it "should return the installed version if present" do
    #  fixture = File.read('spec/fixtures/pkg.query')
    #  provider_class.stub(:get_resource_info) { fixture }
    #  resource[:name] = 'zsh'
    #  expect(provider.query).to eq({:version=>'5.0.2'})
    #end

    it "should return nil if not present" do
      fixture = File.read('spec/fixtures/pkg.query_absent')
      provider_class.stub(:get_resource_info).with('bash') { fixture }
      expect(provider.query).to equal(nil)
    end
  end

  describe "latest" do
    it "should retrieve the correct version of the latest package" do
      provider.latest.should_not nil
    end

    it "should set latest to newer package version when available" do
      instances = provider_class.instances
      curl = instances.find {|i| i.properties[:origin] == 'ftp/curl' }
      curl.properties[:latest].should == "7.33.0_2"
    end

    it "should call update to upgrade the version" do
      resource = Puppet::Type.type(:package).new(
        :name     => 'ftp/curl',
        :provider => pkgng,
        :ensure   => :latest
      )


      resource.provider.should_receive(:update)

      resource.property(:ensure).sync
    end
  end

  describe "get_latest_version" do
    it "should rereturn nil when the current package is the latest" do
      nmap_latest_version = provider_class.get_latest_version('security/nmap')
      nmap_latest_version.should be_nil
    end
  end
end
