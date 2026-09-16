cask "lyrisland" do
  version "0.7.2"
  sha256 "20034d697ad5564288da050c98794d5fdfa8915ee99db67d0ae407ba35ea6189"

  url "https://github.com/EurFelux/Lyrisland/releases/download/v#{version}/Lyrisland-#{version}.zip"
  name "Lyrisland"
  desc "Menu bar lyrics app for Spotify"
  homepage "https://github.com/EurFelux/Lyrisland"

  depends_on macos: :sonoma

  app "Lyrisland.app"

  postflight_steps do
    run "/usr/bin/xattr", args: ["-cr", "{{appdir}}/Lyrisland.app"]
  end

  zap trash: [
    "~/Library/Caches/com.wangjiyuan.Lyrisland",
    "~/Library/Preferences/com.wangjiyuan.Lyrisland.plist",
  ]
end
