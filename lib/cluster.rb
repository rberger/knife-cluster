require 'cluster/dsl_object'
require 'cluster/cloud'
require 'cluster/security_group'
require 'cluster/compute'

module Cluster
  Chef::Config[:clusters] ||= {}

  def self.connection
    @connection ||= Fog::AWS::Compute.new({
        :aws_access_key_id     => Chef::Config[:knife][:aws_access_key_id],
        :aws_secret_access_key => Chef::Config[:knife][:aws_secret_access_key],
        #  :region                => region
      })
  end

  def self.servers
    Cluster.connection.servers.all
  end

  def self.running_servers
  end

  def self.clusters
    Chef::Config[:clusters]
  end


  def self.cluster name, &block
    cl = self.clusters[name] ||= Cluster::Cluster.new(name)
    cl.instance_eval(&block) if block
    cl
  end

  #
  # From chef, find each node by its cluster_name
  #
  def self.find_chef_by_cluster_name
    # cluster_name:*
  end

  #
  # From fog, find each node and match cluster_facets against security groups
  #


  def self.cluster_facets
    clusters.map{|cluster_name, cl| cl.facets.map{|facet_name, f| "#{cluster_name}-#{facet_name}" }}.flatten
  end
end
