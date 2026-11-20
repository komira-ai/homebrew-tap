class Mopm < Formula
  desc "Package manager for Mojo"
  homepage "https://mopm.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.131/mopm-0.0.131-macos-arm64.tar.gz"
      sha256 "8bf7e3f395b8c380c93d0d5586a4f91e884f9c75cb79f4cfcff67c6c1e547eb7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.131/mopm-0.0.131-linux-aarch64.tar.gz"
      sha256 "aeb6c2061294a884544b59e3ffa67a00214b82f6c4d7578222b15bc5ae5d3a6e"
    end
    on_intel do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.131/mopm-0.0.131-linux-x86_64.tar.gz"
      sha256 "e38de5698a6318ae05a93ab279321896d79e0a1635d50beade04587b52c279c3"
    end
  end

  def install
    bin.install "mopm"
  end

  test do
    assert_match "mopm #{version}", shell_output("#{bin}/mopm --version")
  end
end
