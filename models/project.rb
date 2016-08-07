class Project
  include Mongoid::Document
  include Mongoid::Timestamps # adds created_at and updated_at fields

  # field <name>, :type => <type>, :default => <value>
  field :name, :type => String 
  field :git, :type => String
  field :git_user, :type => String
  field :git_pwd, :type => String
  field :local_dir, :type => String
  field :local_server,:type=>String
  field :local_user,:type=>String
  field :local_pwd,:type=>String
  field :remote_server, :type => String
  field :server_user, :type => String
  field :server_pwd, :type => String
  field :remote_dir, :type => String
  field :command, :type => Hash

  # You can define indexes on documents using the index macro:
  # index :field <, :unique => true>

  # You can create a composite key in mongoid to replace the default id using the key macro:
  # key :field <, :another_field, :one_more ....>
end
