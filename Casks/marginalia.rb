cask "marginalia" do
  version "0.25.0"
  sha256 "ee5c13ee886202be756f4e7b6485cbf68521f1bbf34ff2cb82d20e139c8bc6e2"

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
