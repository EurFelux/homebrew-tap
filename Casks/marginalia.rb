cask "marginalia" do
  version "0.9.0"
  sha256 "0ee2f54e15392194d1da508d41024285c8081dd874d13b3a770278a885c065b6"

  url "https://github.com/EurFelux/marginalia/releases/download/v#{version}/marginalia-#{version}-arm64.dmg"
  name "Marginalia"
  desc "AI-native ePub and PDF reader — select text and ask, with transparent context"
  homepage "https://github.com/EurFelux/marginalia"

  depends_on arch: :arm64

  app "marginalia.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/marginalia.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Application Support/marginalia",
    "~/Library/Caches/com.electron.marginalia",
    "~/Library/Preferences/com.electron.marginalia.plist",
    "~/Library/Saved Application State/com.electron.marginalia.savedState",
  ]
end
