def plugins?
  system('grep -q daisyui config/tailwind.config.js')
end

raise 'Consider removing this patch' unless Rails.version == '7.0.4' && Tailwindcss::VERSION == '2.0.29' && plugins?

Rake::Task['tailwindcss:build'].enhance(['yarn:install']) if Rails.env.production?
