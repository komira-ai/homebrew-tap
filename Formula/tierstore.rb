class Tierstore < Formula
  desc "S3 server over a hot and a cold tier of S3-compatible stores"
  homepage "https://tierstore.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.174/tierstore-0.3.174-macos-arm64.tar.gz"
      sha256 "b90acffaa912cd67a5a90025a7db149737734a121bacb27eb4de854ea94dd8c1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.174/tierstore-0.3.174-linux-aarch64.tar.gz"
      sha256 "76160a3575bf5926799d32fb378b197cdd185fb6bde5d4f45e2b0eba52cffdaf"
    end
    on_intel do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.174/tierstore-0.3.174-linux-x86_64.tar.gz"
      sha256 "3b8ef5ea519070d0a2d94be873a980290f80d6658d6c524719a65b0f903dcac8"
    end
  end

  def install
    bin.install "tierstore"
  end

  test do
    assert_match "tierstore #{version}", shell_output("#{bin}/tierstore --version")
  end
end
