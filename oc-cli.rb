class OcCli < Formula
  desc "Open Content CLI"
  homepage "https://bitbucket.org/infomaker/oc-cli"
  url "https://s3-eu-west-1.amazonaws.com/open-content-artifacts/oc-cli/oc-cli.tar.gz"
  sha256  "d1fa4d2334035faba26e1b248be36558231e1ce4f3295ded58470176a8d662e2"

  depends_on "go" => :build

  def install
	  ENV["GOPATH"] = buildpath

    # commented out when building application locally when installing it
    # system "go", "get", "github.com/aws/aws-sdk-go"
    # system "go", "get", "-u", "github.com/spf13/cobra/cobra"
    # system "go", "get", "github.com/cpuguy83/go-md2man"
    # system "go", "get", "-u", "github.com/disintegration/imaging"
    # system "go", "get", "-u", "github.com/satori/go.uuid"
    #
    #
    # # Need to move directory structure to src, to be able to build
    # system "script/move-for-homebrew.sh"
    #
    # # Generate the bash completion script
    # system "go", "run", "src/oc-cli/oc-cli-bash-completion.go"
    #
 	  # system "go", "build", "-o", "oc-cli", "-ldflags", "-X main.Version=0.3", "src/oc-cli/oc-cli.go"

	  bin.install "oc-cli"
	  bash_completion.install "bash-completion/oc-cli"
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! It's enough to just replace
    # "false" with the main program this formula installs, but it'd be nice if you
    # were more thorough. Run the test with `brew test oc-cli`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "#{bin}/oc-cli"
  end
end
