::Mdm::Workspace.delete_all

FactoryGirl.create_list :mdm_workspace, 3

key = FactoryGirl.create :api_key
