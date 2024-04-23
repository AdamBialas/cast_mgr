# encoding: utf-8

module CastMgr

  @@ModuleRoleList = {}

  def self.list
    @@ModuleRoleList
  end

  #global list of roles for build view to add for user account
  def self.global_role_list
    out = {}
    @@ModuleRoleList.each do |_key, value|
      out[_key.to_s] = value.constants(false).map { |s| { s.to_s => value.const_get(s) }  if s.start_with?("R_")  }
    end
    out
  end
end

