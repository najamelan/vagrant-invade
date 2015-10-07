module VagrantPlugins
  module Invade
    module Validator
      module Provision

        class Puppet

          attr_accessor :env
          attr_accessor :puppet

          DEFAULT = {
            'folder' => './puppet',
            'modules' => 'modules',
            'manifests' => 'manifests',
            'manifest_file' => 'init.pp',
            'hiera_config_path' => nil,
            'facter' => []
          }

          def initialize(env, puppet)
            @env = env
            @puppet = Provision.validate_base(env, puppet)
          end

          def validate
            return nil unless @puppet

            # FOLDER
            @puppet['folder'] = Validator.validate_string(
              @puppet['folder'], 'folder', DEFAULT['folder']
            )

            # MODULES PATH
            @puppet['modules_path'] = Validator.validate_string(
              @puppet['modules_path'], 'modules_path', DEFAULT['modules_path']
            )

            # MANIFESTS PATH
            @puppet['manifests_path'] = Validator.validate_string(
              @puppet['manifests_path'], 'manifests_path', DEFAULT['manifests_path']
            )

            # MANIFEST FILE
            @puppet['manifest_file'] = Validator.validate_string(
              @puppet['manifest_file'], 'manifest_file', DEFAULT['manifest_file']
            )

            # HIERA CONFIG PATH
            @puppet['hiera_config_path'] = Validator.validate_string(
              @puppet['hiera_config_path'], 'hiera_config_path', DEFAULT['hiera_config_path']
            )

            # FACTER
            @puppet['facter'] = Validator.validate_array(
              @puppet['facter'], 'facter', DEFAULT['facter']
            )

            @puppet
          end

          def self.default(params)
            @folder = params[:folder]
            @modules_path = params[:modules_path]
            @manifests_path = params[:manifests_path]
          end
        end
      end
    end
  end
end