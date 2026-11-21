class Mopm < Formula
  desc "Package manager for Mojo"
  homepage "https://mopm.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.136/mopm-0.0.136-macos-arm64.tar.gz"
      sha256 "43dfa1e7aa9c3003c2580ffebaada6745470fe7b8e6a288c075270801b15853c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.136/mopm-0.0.136-linux-aarch64.tar.gz"
      sha256 "4c41e07dcb90607459423e547c288706cc33cae2a7640f4b3b6957bfcf850b0f"
    end
    on_intel do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.136/mopm-0.0.136-linux-x86_64.tar.gz"
      sha256 "dda96c8dc30187b0299f654425820e857e9c2374bce3495eca2683ca04941383"
    end
  end

  def install
    bin.install "mopm"
  end

  test do
    assert_match "mopm #{version}", shell_output("#{bin}/mopm --version")
  end
end
