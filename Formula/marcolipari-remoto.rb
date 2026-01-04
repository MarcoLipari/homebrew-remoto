class MarcolipariRemoto < Formula
  desc "Voice-controlled remote computer access system"
  homepage "https://github.com/MarcoLipari/Remoto-Mac"
  url "https://github.com/marcolipari/remoto-mac/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "b2c3f199703497d7a8ad6bcc0007d3bc1d517eed5e8f30725ecbe0bcbb5945c6"

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
