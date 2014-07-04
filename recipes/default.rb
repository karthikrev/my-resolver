#
# Cookbook Name:: my-resolver
# Recipe:: default
#
# Copyright 2014,
#
# All rights reserved - Do Not Redistribute
#

include_recipe "resolver"
begin
    resolver_tmpl = resources(:template => "/etc/resolv.conf")
    resolver_tmpl.cookbook "my-resolver"
rescue Chef::Exceptions::FileNotFound
    Chef::Log.warn "Could not use custom resolver file "
end
