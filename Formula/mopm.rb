class Mopm < Formula
  desc "Package manager for Mojo"
  homepage "https://mopm.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.107/mopm-0.0.107-macos-arm64.tar.gz"
      sha256 "747cf224fd61e54ab3744bfd48851d53ed7d110ab1b134bb2c0e18381cd3cf32"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.107/mopm-0.0.107-linux-aarch64.tar.gz"
      sha256 "f8eda943818e1fa88f277895cf094699d30777fe098c47529da111fa782aafb2"
    end
    on_intel do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.107/mopm-0.0.107-linux-x86_64.tar.gz"
      sha256 "8f26d32064f1fb503f766a7bf49080927bd3427a27543879a0e88235d95b4a8e"
    end
  end

  def install
    bin.install "mopm"
  end

  test do
    assert_match "mopm #{version}", shell_output("#{bin}/mopm --version")
  end
end
