class Mopm < Formula
  desc "Package manager for Mojo"
  homepage "https://mopm.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.115/mopm-0.0.115-macos-arm64.tar.gz"
      sha256 "a5a471d3d1c5be3acb6ea49601f41b9324cf71a1799c326bc094a040051c4538"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.115/mopm-0.0.115-linux-aarch64.tar.gz"
      sha256 "357cab99129c594d040430bb50ae3f02e2807e0d8490cc4c9af45666efa2fe91"
    end
    on_intel do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.115/mopm-0.0.115-linux-x86_64.tar.gz"
      sha256 "57e32e2e4715a91fb1e3c7f0affd75a065e5bb64fbbb39914630e7a592d852de"
    end
  end

  def install
    bin.install "mopm"
  end

  test do
    assert_match "mopm #{version}", shell_output("#{bin}/mopm --version")
  end
end
