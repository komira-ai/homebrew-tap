class Mopm < Formula
  desc "Package manager for Mojo"
  homepage "https://mopm.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.75/mopm-0.0.75-macos-arm64.tar.gz"
      sha256 "fc73057dff32fa5435bf20e8ec7921e355a85ea5bc46dfeb9ea1402055057909"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.75/mopm-0.0.75-linux-aarch64.tar.gz"
      sha256 "04c6fc0f7225dfd19fe8f92836bda67853af1ad480081bb57f2168e9989b4290"
    end
    on_intel do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.75/mopm-0.0.75-linux-x86_64.tar.gz"
      sha256 "42c41d9bc726ef6453d9aa9c21f4cbc0b6d02b1caa657da3117e35adcbf3545a"
    end
  end

  def install
    bin.install "mopm"
  end

  test do
    assert_match "mopm #{version}", shell_output("#{bin}/mopm --version")
  end
end
