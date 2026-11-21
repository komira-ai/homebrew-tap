class Mopm < Formula
  desc "Package manager for Mojo"
  homepage "https://mopm.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.137/mopm-0.0.137-macos-arm64.tar.gz"
      sha256 "2a1d5f388e89c86c3be79e1d1d0de31cd7263938913b9cadba84ee5d8b04523b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.137/mopm-0.0.137-linux-aarch64.tar.gz"
      sha256 "6d428c5fa81844c0a0c0fcd6445bc7239c7dc89173656e341aea54aa8c8ba1e6"
    end
    on_intel do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.137/mopm-0.0.137-linux-x86_64.tar.gz"
      sha256 "cdec3b51dc0e22484ab2d408d52ed226e1b1cbdeaec8c093222bbc08bfbac6a7"
    end
  end

  def install
    bin.install "mopm"
  end

  test do
    assert_match "mopm #{version}", shell_output("#{bin}/mopm --version")
  end
end
