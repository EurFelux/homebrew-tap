cask "marginalia" do
  version "0.18.3"
  sha256 "02fecce92165d4a0b8572a8a825de4aaab9d528c9d6f78c71eddd208989774d1"

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
