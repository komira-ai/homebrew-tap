class Mopm < Formula
  desc "Package manager for Mojo"
  homepage "https://mopm.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.94/mopm-0.0.94-macos-arm64.tar.gz"
      sha256 "117dbe37a54717c4492b0576efae007901fe2140421cc7954504a9fa2935ae9e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.94/mopm-0.0.94-linux-aarch64.tar.gz"
      sha256 "13afe2c0ccdad4a80f4be34ae22509618ce1cf92fb3ab179b0183d675c82f29a"
    end
    on_intel do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.94/mopm-0.0.94-linux-x86_64.tar.gz"
      sha256 "3c1677fe81e1dcdf6e8cefc3761ec1995d8ccc40a6ee3624762c1edf2f320a62"
    end
  end

  def install
    bin.install "mopm"
  end

  test do
    assert_match "mopm #{version}", shell_output("#{bin}/mopm --version")
  end
end
