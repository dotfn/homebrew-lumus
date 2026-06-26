cask "lumus-control" do
  version "0.3.10"
  sha256 "661816065b457c10c1a98490c2ed8ca613b5d41a79e7f6cc6edaa312d070f87a"

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
