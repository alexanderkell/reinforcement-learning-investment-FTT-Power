from __future__ import absolute_import
from __future__ import division
from __future__ import print_function
"""Example of querying a policy server. Copy this file for your use case.
To try this out, in two separate shells run:
    $ python cartpole_server.py
    $ python cartpole_client.py
"""

import argparse
import gym
import numpy as np

from ray.rllib.utils.policy_client import PolicyClient

import sys
sys.path.append("/Users/b1017579/Documents/PhD/Projects/12-Reinforcement-Learning/Examples/")

from custom_gym.gym_foo.gym_foo.envs.foo_env import FooEnv

parser = argparse.ArgumentParser()
parser.add_argument(
    "--no-train", action="store_true", help="Whether to disable training.")
parser.add_argument(
    "--off-policy",
    action="store_true",
    help="Whether to take random instead of on-policy actions.")
parser.add_argument(
    "--stop-at-reward",
    type=int,
    default=9999,
    help="Stop once the specified reward is reached.")

if __name__ == "__main__":
    args = parser.parse_args()
    env = FooEnv()

    client = PolicyClient("http://localhost:9900")

    eid = client.start_episode(training_enabled=not args.no_train)
    obs = env.reset()
    rewards = 0

    while True:
        # if args.off_policy:
        #     action = env.action_space.sample()
        #     client.log_action(eid, obs, action)
        # else:
        action = client.get_action(eid, obs)
        obs, reward, done, info = env.step(action)
        # print("obs: {}, reward: {}, done: {}, info: {}".format(obs, reward, done, info))
        client.log_returns(eid, reward, info=info)
        if done:
            # print("Total reward:", reward)
            print("Average reward:", np.mean([value for agent, value in reward.items()]))
            if rewards >= args.stop_at_reward:
                print("Target reward achieved, exiting")
                exit(0)
            rewards = 0
            client.end_episode(eid, obs)
            obs = env.reset()
            eid = client.start_episode(training_enabled=not args.no_train)
