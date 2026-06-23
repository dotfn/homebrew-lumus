cask "lumus-control" do
  version "0.3.0"
  sha256 :no_check  # el workflow pondrá el SHA real en el próximo release

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
