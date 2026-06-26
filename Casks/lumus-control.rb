cask "lumus-control" do
  version "0.3.10"
  sha256 "9957aac2fa2ff9d3f8da24d2d8d63375c2b6b5440bc04604c300a92693f05cab"

  url "https://github.com/dotfn/lumus-control/releases/download/v#{version}/lumus-control_#{version}_aarch64.dmg",
      verified: "github.com/dotfn/lumus-control/"
  name "Lumus Control"
  desc "Panel local para controlar lámparas WiZ via UDP"
  homepage "https://lumus-control.vercel.app"

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
end
