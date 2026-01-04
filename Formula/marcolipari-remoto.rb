# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://docs.brew.sh/rubydoc/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Remoto < Formula
  desc "Voice-controlled remote computer access system"
  homepage "https://github.com/MarcoLipari/Remoto-Mac"
  head "https://github.com/MarcoLipari/Remoto-Mac", branch: "main"
  
  depends_on "mediamtx"
  depends_on "ffmpeg"
  depends_on "cloudflare/cloudflare/cloudflared"

  def install
    # Install the scripts to libexec (hidden from user)
    libexec.install "MacQuickInstall"
    libexec.install "RemotoMacAliases"
  end

  def post_install
    ohai "Setting up Remoto..."
    
    # Run MacQuickInstall to create ~/.remoto scripts and config
    system "bash", "#{libexec}/MacQuickInstall"
    
    # Run RemotoMacAliases to add aliases to ~/.zshrc
    system "bash", "#{libexec}/RemotoMacAliases"
    
    puts ""
    puts "╔════════════════════════════════════════════════╗"
    puts "║        ✅ Remoto Installed Successfully! 🎉   ║"
    puts "╚════════════════════════════════════════════════╝"
    puts ""
    puts "⚠️  IMPORTANT: Restart your terminal or run:"
    puts "   source ~/.zshrc"
    puts ""
    puts "Then use these commands:"
    puts "   remoto-start       - Start streaming (URL auto-copies to clipboard)"
    puts "   remoto-stop        - Stop all services"
    puts "   remoto-status      - Check what's running"
    puts "   remoto-logs        - View recent logs"
    puts "   remoto-autostart   - Enable auto-start on login"
    puts ""
    puts "📺 The stream URL will automatically copy to your clipboard"
    puts "   Paste it into your frontend config 'Livestream URL' field"
    puts ""
    puts "📁 Scripts installed to: ~/.remoto/"
    puts "🖥️  Desktop shortcut created: Start Remoto.command"
    puts ""
  end

  def caveats
    <<~EOS
      To use remoto commands, restart your terminal or run:
        source ~/.zshrc

      Then start streaming with:
        remoto-start
    EOS
  end

  test do
    # Test that the setup created the expected files
    assert_predicate testpath/".remoto/start.sh", :exist?
    assert_predicate testpath/".remoto/stop.sh", :exist?
    assert_predicate testpath/".remoto/status.sh", :exist?
  end
end