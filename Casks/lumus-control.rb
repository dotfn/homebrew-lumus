cask "lumus-control" do
  version "0.3.9"
  sha256 "17941c064987c87c93aed6de85b77b117e98547121cb5882d31e0378eda2ef66"

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

  app "lumus-control.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/lumus-control.app"]
  end
end
