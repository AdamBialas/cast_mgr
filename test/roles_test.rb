require_relative "test_helper"

describe CastMgr::Roles do

  class Worker
    include CastMgr::Roles
    extend CastMgr::Roles
    create_roles_group %i[new edit admin delete ]
  end

  class Runner
    include CastMgr::Roles
    extend CastMgr::Roles
    create_roles_group %i[new edit admin ]
  end

  let(:worker) { Worker.new }
  let(:runner) { Runner.new }

  describe "#global_role_list" do
    it "count" do
      CastMgr::global_role_list.count.must_equal 2
    end
  end

  describe "role_list" do
    it "worker count" do

      worker.role_list.count.must_equal 4
    end

    it "runner count" do
      runner.role_list.count.must_equal 3
    end

    it "worker array" do
      (worker.role_list - [{"R_Worker_new"=>:new}, {"R_Worker_edit"=>:edit}, {"R_Worker_admin"=>:admin}, {"R_Worker_delete"=>:delete}]).must_equal []
    end

    it "runner array" do
      (runner.role_list - [{"R_Runner_new"=>:new}, {"R_Runner_edit"=>:edit}, {"R_Runner_admin"=>:admin}]).must_equal []
    end
  end

end