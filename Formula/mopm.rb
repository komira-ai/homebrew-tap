class Mopm < Formula
  desc "Package manager for Mojo"
  homepage "https://mopm.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.149/mopm-0.0.149-macos-arm64.tar.gz"
      sha256 "93611aaa3ead4c8a0041134691e3c6cefae0a0b3949ea48325df88c96fe556d1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.149/mopm-0.0.149-linux-aarch64.tar.gz"
      sha256 "4007aa79a94c33bcb86f1b0e3d526946c25a5b33c1cf0fe94093481fa90b87e4"
    end
    on_intel do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.149/mopm-0.0.149-linux-x86_64.tar.gz"
      sha256 "10ead415a812e5f781325d5f542fbafb6af0b78e44906fce9380ed42553ed4bc"
    end
  end

  def install
    bin.install "mopm"
  end

  test do
    assert_match "mopm #{version}", shell_output("#{bin}/mopm --version")
  end
end
