cask "lyrisland" do
  version "0.7.1"
  sha256 "4a06f2f5f080db56882736ea30f166ea199ea1530578b2f667aa00ccc07c0f08"

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
