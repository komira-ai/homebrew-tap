class Mopm < Formula
  desc "Package manager for Mojo"
  homepage "https://mopm.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.124/mopm-0.0.124-macos-arm64.tar.gz"
      sha256 "51dad1e1cfd1973c565e600ee07365c1e48df29663a9fda1fce22156a7c8a822"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.124/mopm-0.0.124-linux-aarch64.tar.gz"
      sha256 "fc17e6e925e037e9d446f42e2b023d5afdfeebdfade0fdd56101cfb2ff362a0f"
    end
    on_intel do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.124/mopm-0.0.124-linux-x86_64.tar.gz"
      sha256 "aa4d197cbf95ecc3f5ab91152dcd7a6055cedd674354fdcd5546cf09eb49c728"
    end
  end

  def install
    bin.install "mopm"
  end

  test do
    assert_match "mopm #{version}", shell_output("#{bin}/mopm --version")
  end
end
