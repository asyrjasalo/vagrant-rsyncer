module Vagrant
  module Syncer
    class Plugin < Vagrant.plugin(2)

      name "Syncer"

      description <<-DESC
      Watches for changed files on the host and synchronizes them to the machine.
      DESC

      config "syncer" do
        require 'syncer/config'
        Vagrant::Syncer::Config
      end

      command "syncer" do
        require 'syncer/commands/syncer'
        Vagrant::Syncer::Commands::Syncer
      end

      action_hook "start-syncer" do |hook|
        hook.after Vagrant::Action::Builtin::SyncedFolders,
          Vagrant::Syncer::Actions::StartSyncer
      end

    end
  end
end
