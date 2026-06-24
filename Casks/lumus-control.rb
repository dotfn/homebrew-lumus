cask "lumus-control" do
  version "0.3.8"
  sha256 "f235fd758312490a842f815961d8175c7dc76a606742a990937ccd98c8dd1016"

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
