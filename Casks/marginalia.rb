cask "marginalia" do
  version "0.19.0"
  sha256 "85d000351a76c6b8c9caa88d0af35b372f7390ecfca2e6750670b2175254c7c0"

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
