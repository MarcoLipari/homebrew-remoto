class MarcolipariRemoto < Formula
  desc "Voice-controlled remote computer access system"
  homepage "https://github.com/MarcoLipari/Remoto-Mac"
  url "https://github.com/marcolipari/remoto-mac/archive/refs/tags/v0.1.2.tar.gz"
  sha256 "e946192cc5411dd92bf8c9fd569aeaf6e464eb697c88f9f0f29538068eb7aca3"

  depends_on "cloudflare/cloudflare/cloudflared"
  depends_on "ffmpeg"
  depends_on "mediamtx"

  def install
    libexec.install Dir["*"]
    chmod 0755, "#{libexec}/RemotoMacInstaller/MacQuickInstall"
    bin.install_symlink "#{libexec}/RemotoMacInstaller/MacQuickInstall" => "remoto-install"
  end

  def caveats
    <<~EOS
      Run the installer with:
        remoto-install
    EOS
  end

  test do
    assert_path_exists libexec/"RemotoMacInstaller/MacQuickInstall", :exist?
  end
end
