--
-- PostgreSQL database dump
--

-- Dumped from database version 16.3
-- Dumped by pg_dump version 16.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: user_agent; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE user_agent (
    user_agent_id character varying(20) NOT NULL,
    browser_type_id character varying(20),
    platform_type_id character varying(20),
    protocol_type_id character varying(20),
    user_agent_type_id character varying(20),
    user_agent_method_type_id character varying(20),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.user_agent OWNER TO ofbiz;

--
-- Name: user_agent pk_user_agent; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY user_agent
    ADD CONSTRAINT pk_user_agent PRIMARY KEY (user_agent_id);


--
-- Name: uagent_browser; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX uagent_browser ON user_agent USING btree (browser_type_id);


--
-- Name: uagent_method; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX uagent_method ON user_agent USING btree (user_agent_method_type_id);


--
-- Name: uagent_platform; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX uagent_platform ON user_agent USING btree (platform_type_id);


--
-- Name: uagent_protocol; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX uagent_protocol ON user_agent USING btree (protocol_type_id);


--
-- Name: uagent_type; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX uagent_type ON user_agent USING btree (user_agent_type_id);


--
-- Name: user_agent_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX user_agent_txcrts ON user_agent USING btree (created_tx_stamp);


--
-- Name: user_agent_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX user_agent_txstmp ON user_agent USING btree (last_updated_tx_stamp);


--
-- Name: user_agent uagent_browser; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY user_agent
    ADD CONSTRAINT uagent_browser FOREIGN KEY (browser_type_id) REFERENCES browser_type(browser_type_id);


--
-- Name: user_agent uagent_method; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY user_agent
    ADD CONSTRAINT uagent_method FOREIGN KEY (user_agent_method_type_id) REFERENCES user_agent_method_type(user_agent_method_type_id);


--
-- Name: user_agent uagent_platform; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY user_agent
    ADD CONSTRAINT uagent_platform FOREIGN KEY (platform_type_id) REFERENCES platform_type(platform_type_id);


--
-- Name: user_agent uagent_protocol; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY user_agent
    ADD CONSTRAINT uagent_protocol FOREIGN KEY (protocol_type_id) REFERENCES protocol_type(protocol_type_id);


--
-- Name: user_agent uagent_type; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY user_agent
    ADD CONSTRAINT uagent_type FOREIGN KEY (user_agent_type_id) REFERENCES user_agent_type(user_agent_type_id);


--
-- PostgreSQL database dump complete
--

