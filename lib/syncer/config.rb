module Vagrant
  module Syncer
    class Config < Vagrant.plugin(2, :config)

      attr_accessor :interval, :run_on_startup, :show_events, :ssh_args

      def initialize
        @interval       = UNSET_VALUE
        @show_events    = UNSET_VALUE
        @ssh_args       = UNSET_VALUE
        @run_on_startup = UNSET_VALUE
      end

      def finalize!
        @interval = 0.2          if @interval == UNSET_VALUE || @interval <= 0.2
        @run_on_startup = true   if @run_on_startup == UNSET_VALUE
        @show_events = false     if @show_events == UNSET_VALUE

        if @ssh_args = UNSET_VALUE
          @ssh_args = [
            '-o StrictHostKeyChecking=no',
            '-o IdentitiesOnly=true',
            '-o UserKnownHostsFile=/dev/null',
          ]

          unless Vagrant::Util::Platform.windows?
            @ssh_args += [
              '-o ControlMaster=auto',
              "-o ControlPath=#{File.join(Dir.tmpdir, "ssh.#{rand(1000)}")}",
              '-o ControlPersist=10m'
            ]
          end
        end
      end

    end
  end
end
