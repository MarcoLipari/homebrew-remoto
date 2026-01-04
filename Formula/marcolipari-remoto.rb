class MarcolipariRemoto < Formula
  desc "Voice-controlled remote computer access system"
  homepage "https://github.com/MarcoLipari/Remoto-Mac"
  url "https://github.com/marcolipari/remoto-mac/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "f5f1cf8510733397779885a8f05de8f76966b9b955ffbbd259ecd50917c5bc1a"

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
