class Mopm < Formula
  desc "Package manager for Mojo"
  homepage "https://mopm.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.59/mopm-0.0.59-macos-arm64.tar.gz"
      sha256 "35ae0ef5d30bfd0988b447588666f31886fc458ab8e69c743428c131c65117d9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.59/mopm-0.0.59-linux-aarch64.tar.gz"
      sha256 "894b0be05ab50e34419b0126f2a54596c46a8c07a5a65ca2d20b33658d49878c"
    end
    on_intel do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.59/mopm-0.0.59-linux-x86_64.tar.gz"
      sha256 "dfb71b1bf53091d74565a45c888c9cec56ba2a03ac801b602269fd454c41d3c4"
    end
  end

  def install
    bin.install "mopm"
  end

  test do
    assert_match "mopm #{version}", shell_output("#{bin}/mopm --version")
  end
end
