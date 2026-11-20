cask "lyrisland" do
  version "0.7.3"
  sha256 "2e2663f8d6dd04ead3907a24fc934fe008d665c8962ddce42737382d260b2059"

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
