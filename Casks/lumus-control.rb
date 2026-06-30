cask "lumus-control" do
  version "0.5.2"
  sha256 "21277c96221f50b9fa7079118571b5a89c01e0771ab9cc9a0620eca53842c06d"

  url "https://github.com/dotfn/lumus-control/releases/download/v#{version}/lumus-control_#{version}_aarch64.dmg",
      verified: "github.com/dotfn/lumus-control/"
  name "Lumus Control"
  desc "Local control panel for WiZ smart lamps over UDP"
  homepage "https://lumus-control.vercel.app"

  depends_on macos: :big_sur
  depends_on arch: :arm64

  livecheck do
    url :url
    strategy :github_latest
  end

  app "Lumus Control.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Lumus Control.app"]
  end

  zap trash: [
    "~/Library/Application Support/com.lumuscontrol.desktop",
    "~/Library/Caches/com.lumuscontrol.desktop",
    "~/Library/Logs/com.lumuscontrol.desktop",
    "~/Library/WebKit/com.lumuscontrol.desktop",
    "~/Library/Saved Application State/com.lumuscontrol.desktop.savedState",
  ]
end
