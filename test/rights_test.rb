require_relative "test_helper"

describe CastMgr::Rights do

  class Worker
    include CastMgr::Roles
    extend CastMgr::Roles
    include CastMgr::Rights
    extend CastMgr::Rights
    create_roles_group %i[new edit view admin delete ]
  end

  class Runner
    include CastMgr::Roles
    extend CastMgr::Roles
    include CastMgr::Rights
    extend CastMgr::Rights
    create_roles_group %i[new edit admin ]
  end

  let(:user_rights) { "R_Worker_admin,R_Worker_new,R_Worker_edit,R_Runner_admin" }

  let(:worker) { Worker.new }
  let(:runner) { Runner.new }


  describe "validate" do
    it "false for worker :view" do
      worker.validate(user_rights, :view).must_equal false
    end

    it "true for worker :admin" do
      worker.validate(user_rights, :admin).must_equal true
    end

    it "true for runner :admin" do
      runner.validate(user_rights, :admin).must_equal true
    end

  end


  #p w.validate(user_rights, :admin)

  #p w.validate(user_rights, :send)

end