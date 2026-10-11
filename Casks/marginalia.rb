cask "marginalia" do
  version "0.23.0"
  sha256 "629bf378a684fee0a45e5861fb45aa8a07a4ec279f8bc66ba2c665309311070d"

  url "https://github.com/EurFelux/marginalia/releases/download/v#{version}/marginalia-#{version}-arm64.dmg"
  name "Marginalia"
  desc "AI-native ePub and PDF reader — select text and ask, with transparent context"
  homepage "https://github.com/EurFelux/marginalia"

  depends_on arch: :arm64
  depends_on :macos

  app "marginalia.app"

  postflight_steps do
    run "/usr/bin/xattr", args: ["-cr", "{{appdir}}/marginalia.app"]
  end

  zap trash: [
    "~/Library/Application Support/marginalia",
    "~/Library/Caches/com.electron.marginalia",
    "~/Library/Preferences/com.electron.marginalia.plist",
    "~/Library/Saved Application State/com.electron.marginalia.savedState",
  ]
end
