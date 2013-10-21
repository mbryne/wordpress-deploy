namespace :wordpress do
    desc "Setup symlinks for a WordPress project"
    task :create_symlinks, :roles => :web do
        run "ln -nfs #{shared_path}/uploads #{release_path}/content/uploads"
    end
end

namespace :git do
	desc "Updates git submodule tags"
	task :submodule_tags do
		run "if [ -d #{shared_path}/cached-copy/ ]; then cd #{shared_path}/cached-copy/ && git submodule foreach --recursive git fetch origin --tags; fi"
	end
end

namespace :db do
	desc "Sets the database credentials (and other settings) in wp-config.php"
	task :make_config do
		set :staging_domain, '' if staging_domain.nil?
		{:'%%WP_STAGING_DOMAIN%%' => staging_domain, :'%%WP_STAGE%%' => stage, :'%%DB_NAME%%' => wpdb[stage][:name], :'%%DB_USER%%' => wpdb[stage][:user], :'%%DB_PASSWORD%%' => wpdb[stage][:password], :'%%DB_HOST%%' => wpdb[stage][:host]}.each do |k,v|
			run "sed -i 's/#{k}/#{v}/' #{release_path}/wp-config.php", :roles => :web
		end
	end
end