cask "marginalia" do
  version "0.20.0"
  sha256 "c332a1bb4f04110802f4508bee98293e36184dceb22a22cc0237e36f72c61779"

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
