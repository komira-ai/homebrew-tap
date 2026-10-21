class Mopm < Formula
  desc "Package manager for Mojo"
  homepage "https://mopm.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.20/mopm-0.0.20-macos-arm64.tar.gz"
      sha256 "99b0f68eece1fb971b2c1c823e6a2797469a74e2f564e106e06742b1e5b57d0e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.20/mopm-0.0.20-linux-aarch64.tar.gz"
      sha256 "cd216f784546ad92388e24a24e41e19aa05bf2776c4080ed29fb39309afb6eaf"
    end
    on_intel do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.20/mopm-0.0.20-linux-x86_64.tar.gz"
      sha256 "efa525027407f31cd83716a87858252acfed6674c84dc1091d1da111812d2c43"
    end
  end

  def install
    bin.install "mopm"
  end

  test do
    assert_match "mopm #{version}", shell_output("#{bin}/mopm --version")
  end
end
