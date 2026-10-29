class Mopm < Formula
  desc "Package manager for Mojo"
  homepage "https://mopm.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.96/mopm-0.0.96-macos-arm64.tar.gz"
      sha256 "823a682f40d553500080e79e4228637b355bcec94dcea0c743dd37da2fd92d77"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.96/mopm-0.0.96-linux-aarch64.tar.gz"
      sha256 "1091495d1c094d5097c34958ab559a452495f4cef397cbcf7daeb49a04b5703e"
    end
    on_intel do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.96/mopm-0.0.96-linux-x86_64.tar.gz"
      sha256 "2c733796f57a496edd7d9aa187362bee556a0147d7cccc33414ca60a5f01abfc"
    end
  end

  def install
    bin.install "mopm"
  end

  test do
    assert_match "mopm #{version}", shell_output("#{bin}/mopm --version")
  end
end
