module CastMgr
  module Roles

    def self.included(base)
      name = base.to_s.split('::').last
      CastMgr::list[name] = Module.new
      self.include CastMgr::list[name]
    end

    # define list of roles in class as const
    def create_roles_group(roles)
      name = self.to_s.split('::').last
      roles_module = CastMgr::list[name]
      roles.each do |key|
        new_key = "R_#{name}_#{key.downcase}"
        roles_module.const_set(new_key, key)
      end
    end

    # List of Roles for class stored in conts
    def role_list
      name = self.class.to_s.split('::').last
      roles_module = CastMgr::list[name]
      roles_module.constants(false).map { |s| { s.to_s => roles_module.const_get(s) } if s.start_with?("R_#{name}_") }
    end
  end
end


