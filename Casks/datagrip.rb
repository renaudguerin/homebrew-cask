cask 'datagrip' do
  version '2020.1,201.6668.99'
  sha256 'f9238d79fe0232acf937001b9703ebc9f16223ae4fb4b89bdafc0565499f9f52'

  url "https://download.jetbrains.com/datagrip/datagrip-#{version.before_comma}.dmg"
  appcast 'https://data.services.jetbrains.com/products/releases?code=DG&latest=true&type=release'
  name 'DataGrip'
  homepage 'https://www.jetbrains.com/datagrip/'

  auto_updates true

  app 'DataGrip.app'

  uninstall_postflight do
    ENV['PATH'].split(File::PATH_SEPARATOR).map { |path| File.join(path, 'datagrip') }.each { |path| File.delete(path) if File.exist?(path) && File.readlines(path).grep(%r{# see com.intellij.idea.SocketLock for the server side of this interface}).any? }
  end

  zap trash: [
               "~/Library/Application Support/DataGrip#{version.major_minor}",
               "~/Library/Caches/DataGrip#{version.major_minor}",
               "~/Library/Logs/DataGrip#{version.major_minor}",
               "~/Library/Preferences/DataGrip#{version.major_minor}",
             ]
end
