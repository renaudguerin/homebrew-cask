cask "prezi-classic" do
  version "6.14.0,24153"
  sha256 "ed9cc68796e4a055fa01cd28ab593370b6f4d87a937237e2f23f7fba9c70f332"

  url "https://desktopassets.prezi.com/mac/pd6/releases/Prezi_Classic_#{version.before_comma}.dmg"
  name "Prezi Classic"
  homepage "https://prezi.com/desktop"

  livecheck do
    url "https://prezidesktop.s3.amazonaws.com/assets/mac/pd6/updates/prezi-classic.xml"
    strategy :sparkle
  end

  app "Prezi Classic.app"
end
