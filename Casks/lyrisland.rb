cask "lyrisland" do
  version "0.7.0"
  sha256 "6f7038386811fac2aec1d0518775789acc6c2843b3b15cb98e46f4db7f638ff1"

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
