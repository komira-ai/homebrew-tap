class Mopm < Formula
  desc "Package manager for Mojo"
  homepage "https://mopm.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.34/mopm-0.0.34-macos-arm64.tar.gz"
      sha256 "92d81d773af6d49da21e841758661dd7a49a1850378f0f0be95883e028a83483"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.34/mopm-0.0.34-linux-aarch64.tar.gz"
      sha256 "1f4073e436c19b0e7bb73d1cfcc4d7bfd4cc490ea5bb573ddf13b0fd9352dc6c"
    end
    on_intel do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.34/mopm-0.0.34-linux-x86_64.tar.gz"
      sha256 "632e489b8b33e392b6991d9db0485e63124994bbf24071d3f5f1230eefe3bafd"
    end
  end

  def install
    bin.install "mopm"
  end

  test do
    assert_match "mopm #{version}", shell_output("#{bin}/mopm --version")
  end
end
