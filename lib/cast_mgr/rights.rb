module CastMgr
  module Rights

    # validate role exists in user_right_list
    def validate(user_rights, role)
      user_rights.split(',').include?(code(role))
    end

    private

    def code(role)
      name = self.class.to_s.split('::').last
      "R_#{name}_#{role.downcase}" if exists(name, role)
    end

    def exists(name, role)
      return unless CastMgr::list[name].constants(false).include?("R_#{name}_#{role.downcase}".to_sym)
      CastMgr::list[name].const_get("R_#{name}_#{role.downcase}".to_sym) == role
    end

  end
end